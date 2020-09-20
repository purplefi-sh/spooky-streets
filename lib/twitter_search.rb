require 'json'
require 'typhoeus'
require 'securerandom'

class TwitterSearch
  def initialize(bearer_token:, search_url:)
    @bearer_token = bearer_token
    @search_url = search_url
    @next_page = nil
    @results = []
    @backup_file_prefix = SecureRandom.hex(4)
  end

  def search(query)
    loop.with_index do |i|
      response = Typhoeus::Request.new(@search_url, {
        method: 'get',
        headers: {
          "User-Agent": "PurpleFish",
          "Authorization": "Bearer #{@bearer_token}"
        },
        params: {
          "query": query,
          "maxResults": 500,
          "next": @next_page
        }
      }).run

      backup_response_to_file("./#{@backup_file_prefix}-#{i}", response)

      json = JSON.parse(response.body)
      @next_page = json['next']
      page_results = json['results'].map { |tweet| extract(tweet) }

      page_results.each do |tweet|
        attrs = {
          twitter_id: tweet['id_str'],
          text: tweet['text']
        }

        if tweet['place'].present? && tweet['place']['full_name'].present?
          attrs[:location_string] = tweet['place']['full_name']
        end

        if tweet['geo']
          raise 'TODO'
        end

        Tweet.create(attrs)
      end

      results += page_results
      break if @next_page == nil
    end
  end

  def extract(tweet)
    tweet.dup.extract!(*%w[id_str text geo coordinates place])
  end

  def backup_response_to_file(filename, response)
    File.write(filename, JSON.dump(JSON.parse(response.body)))
  end

  def load_response_from_file(filename)
    JSON.parse(File.read(filename))
  end
end

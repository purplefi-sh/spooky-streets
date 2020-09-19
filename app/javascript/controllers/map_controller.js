import { Controller } from "stimulus"
import React from 'react'
import ReactDOM from 'react-dom'
import App from 'src/App'
import 'ol/ol.css';
import {Map, View} from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';

export default class extends Controller {
  static targets = [
    "map"
  ]

  connect() {
    this.loadOlKit()
  }

  loadOlKit() {
    ReactDOM.render(<App />, this.mapTarget)
  }
  
  loadOpenLayers() {
    new Map({
      target: this.mapTarget,
      layers: [
        new TileLayer({
          source: new OSM()
        })
      ],
      view: new View({
        center: [0, 0],
        zoom: 0
      })
    })
  }
}

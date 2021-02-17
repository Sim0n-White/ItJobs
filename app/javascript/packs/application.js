// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery3
//= require rails-ujs
//= require_self

import 'bootstrap'
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import $ from 'jquery';
import 'select2'
import 'select2/dist/css/select2.min.css';

Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")

$(document).ready(function() {
    $('.select2-fullwidth').select2({theme: "bootstrap", width: '100%'});
});


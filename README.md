# dashing.prtg

## Preview
![](https://raw.githubusercontent.com/sbaerlocher/dashing.prtg/master/prtg.png)

## Description

Widget for [Dashing](http://dashing.io/) that shows downs, downs (acknowledgeds) and warnings from [prtg](https://www.paessler.com/prtg).

## Usage

Add this to your Gemfile and run `bundle install`:
```bash
gem 'rest-client'
```

To use this widget, copy `prtg.html`, `prtg.coffee`, and `prtg.scss` into a `/widgets/prtg` directory, and copy the `prtg.rb` file into your `/jobs` folder.

To include the widget in a dashboard, add the following snippet to the dashboard layout file:

```html
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
    <div data-id="prtg" data-view="Prtg"></div>
</li>
```

## Changelog

### 1.0

* Initial release

### 1.1

* fix bug in prtg.rb
 
## Contributor

* [Simon Bärlocher](https://sbaerlocher.ch)
 
## License

This project is under the MIT License. See the [LICENSE](https://sbaerlo.ch/licence) file for the full license text.

## Copyright

(c) 2015, Simon Bärlocher
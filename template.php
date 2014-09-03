<?php

/**
 * @file
 * Preprocess and Process Functions.
 */

/**
 * Implements hook_preprocess_html().
 */
function tarnbib_theme_preprocess_html(&$vars) {
  // Add theme path to global variable.
  drupal_add_js(
    array(
     'pathToTheme' => '/' . drupal_get_path('theme', 'tarnbib_theme'),
     'every_page' => TRUE,
     'scope' => 'header',
     'weight' => -19.95,
    ), 'setting'
  );

  // Add Webtrends.
  drupal_add_js(drupal_get_path('theme', 'tarnbib_theme') . '/js/webtrends.load.js',
    array(
      'scope' => 'footer',
    )
  );

  // Add header link tag for apple-touch-icon.
  $apple_touch_icon = array(
    '#tag' => 'link',
    '#attributes' => array(
      'href' => path_to_theme() . '/images/apple-touch-icon.png',
      'rel' => array(
        'shortcut',
        'icon'
      ),
    )
  );

  drupal_add_html_head($apple_touch_icon, 'apple_touch_icon');
}

/**
 * Implements hook_css_alter().
 */
function tarnbib_theme_css_alter(&$css) {
  // Color module style fetching.
  global $theme_key;
  $uri = variable_get('color_' . $theme_key . '_files');

  if (!file_exists($uri[0])) {
    return;
  }

  $path = file_create_url($uri[0]);

  foreach ($css as $key => $file) {
    if (preg_match('/ddbasic\.css/', $key)) {
      unset($css[$key]);

      $css[$path] = array(
        'data' => $path,
        'type' => 'file',
        'media' => 'all',
        'group' => '100',
        'every_page' => TRUE,
        'weight' => 0,
        'preprocess' => FALSE,
        'browsers' => array(),
      );
      break;
    }
  }
}

```markdown
# Diverse Image  

[![Pub Version](https://img.shields.io/pub/v/diverse_image)](https://pub.dev/packages/diverse_image)  

A Flutter package to easily display images from multiple sources (assets, network, cached files, or local files) and support various formats like JPG, PNG, SVG, and more.  

## Features  
- Display images from **assets**, **network URLs**, **cached files**, or **local files**.  
- Support for multiple formats: **JPG, PNG, SVG**, and others supported by Flutter.  
- Customize image appearance with properties like size, color, border radius, alignment, and more.  
- Simplified and intuitive API.  

## Installation  

Add the following line to your `pubspec.yaml`:  

```yaml  
dependencies:  
  diverse_image: ^1.0.0  
```  

Then run:
```bash  
flutter pub get  
```  

## Usage

### Import the package:
```dart  
import 'package:diverse_image/diverse_image.dart';  
```  

### Display an Image

```dart  
DiverseImage(  
  path: 'image-path', // Source of the image (asset path, URL, cache key, or file path).  
  height: 100,  
  width: 100,  
  size: 50,  
  boxFit: BoxFit.cover,  
  color: Colors.red,  
  borderRadius: BorderRadius.circular(8),  
  isOval: false,  
  alignment: Alignment.center,  
  fromFile: false,  
  blendMode: BlendMode.color,  
)  
```  

### Parameters

| Parameter      | Type               | Description                                                                 | Default             |  
|----------------|--------------------|-----------------------------------------------------------------------------|---------------------|  
| `path`         | `String`           | The source of the image (asset path, URL, cache key, or file path).         | Required            |  
| `height`       | `double?`          | The height of the image.                                                   | `null`              |  
| `width`        | `double?`          | The width of the image.                                                    | `null`              |  
| `size`         | `double?`          | If provided, sets both `height` and `width` for a square image.            | `null`              |  
| `boxFit`       | `BoxFit?`          | Defines how the image should be resized to fit its container.              | `BoxFit.cover`      |  
| `color`        | `Color?`           | Applies a color overlay to the image.                                      | `null`              |  
| `borderRadius` | `BorderRadius?`    | Rounds the corners of the image.                                           | `null`              |  
| `isOval`       | `bool`             | Displays the image with an oval shape.                                     | `false`             |  
| `alignment`    | `AlignmentGeometry`| Alignment of the image within its container.                               | `Alignment.center`  |  
| `fromFile`     | `bool`             | If `true`, loads the image from a local file path.                         | `false`             |  
| `blendMode`    | `BlendMode?`       | Blend mode applied to the image when a color is used.                      | `null`              |  

### Examples

#### Load an Asset Image:
```dart  
DiverseImage(  
  path: 'assets/images/sample.png',  
  height: 100,  
  width: 100,  
  borderRadius: BorderRadius.circular(10),  
)  
```  

#### Load a Network Image:
```dart  
DiverseImage(  
  path: 'https://example.com/image.jpg',  
  size: 150,  
  isOval: true,  
)  
```  

#### Load a Local File Image:
```dart  
DiverseImage(  
  path: '/storage/emulated/0/Download/sample.jpg',  
  fromFile: true,  
  width: 200,  
  height: 200,  
  alignment: Alignment.topLeft,  
)  
```  

#### Apply Color Overlay:
```dart  
DiverseImage(  
  path: 'assets/images/sample.png',  
  color: Colors.black.withOpacity(0.5),  
  blendMode: BlendMode.darken,  
)  
```  

## Example

Here’s a complete example of using `DiverseImage`:

```dart  
import 'package:flutter/material.dart';  
import 'package:diverse_image/diverse_image.dart';  

void main() {  
  runApp(MyApp());  
}  

class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: Scaffold(  
        appBar: AppBar(  
          title: Text('Diverse Image Example'),  
        ),  
        body: Center(  
          child: DiverseImage(  
            path: 'https://example.com/image.jpg',  
            size: 150,  
            boxFit: BoxFit.cover,  
            isOval: true,  
          ),  
        ),  
      ),  
    );  
  }  
}  
```  

## Contributing

We welcome contributions! Please check the [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
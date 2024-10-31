enum Website {
  oms,
}

class WebsiteInfo {
  final String name;

  WebsiteInfo(this.name);
}

extension WebsiteExtension on Website {
  WebsiteInfo get info {
    switch (this) {
      case Website.oms:
        return WebsiteInfo('oms');
    }
  }
}

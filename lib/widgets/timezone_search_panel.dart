import 'package:clock_challenge/model/location_response_entity.dart';
import 'package:clock_challenge/network/http_service.dart';
import 'package:flutter/material.dart';

class TimezoneSearchPanel extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TimezoneSearchState();
  }

}


class _TimezoneSearchState extends State<TimezoneSearchPanel> {

  LocationResponse _response;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text('Test'),
            onPressed: () async {
              LocationResponse res = await HttpService.getService().getLocations('深圳');
              setState(() {
                _response = res;
              });
            },
          ),
          Container(
            child: ListView.builder(
                itemCount: _itemCount(),
                itemBuilder: (context, index) {
                  if (_response != null && _response.location != null) {
                    return ListTile(
                      title: Text('${_response.location[index].name}'),
                      subtitle: Text('${_response.location[index].country}'),
                      onTap: () {

                      },
                    );
                  }
                  return null;
                }),
            height: 200,
          )
          ,
        ],
      ),
    );
  }

  int _itemCount() {
    if (_response == null || _response.location == null) {
      return 0;
    }

    return _response.location.length;
  }

}
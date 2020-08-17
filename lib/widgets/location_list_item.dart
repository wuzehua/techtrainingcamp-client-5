import 'package:clock_challenge/model/location_response_entity.dart';
import 'package:flutter/material.dart';

class LocationListItem extends StatelessWidget {

  final VoidCallback onPressed;
  final Location location;

  LocationListItem(this.location,
                    {Key key,
                    this.onPressed})
      :super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlatButton(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(location.name),
                    Text('${location.country} ${location.adm1} ${location.adm2}'),
                    Text('${location.lat} ${location.lon}')
                  ],
                ),
              ),
              Text('GMT${location.utcOffset}')
            ],
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }

}
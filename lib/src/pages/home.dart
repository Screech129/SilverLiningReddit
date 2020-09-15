import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sparkitecture/src/widgets/styled_scaffold.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StyledScaffold("Home", _buildBody(context));
  }

  _buildBody(BuildContext context) {
    AudioPlayer audioPlayer = AudioPlayer();

    audioPlayer.play(
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview123/v4/75/5a/fc/755afca1-d911-be2b-c0fb-f99d6d52ce1a/mzaf_4156076990936187406.plus.aac.p.m4a');
    return Text("This is the homepage!");
  }
}

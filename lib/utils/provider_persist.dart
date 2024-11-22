import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/timezone_model.dart';

class ProviderPersist extends StatefulWidget {
  final Widget child;
  const ProviderPersist({super.key, required this.child});

  @override
  State<ProviderPersist> createState() => _ProviderPersistState();
}

class _ProviderPersistState extends State<ProviderPersist> {
  late final AppLifecycleListener _listener;
  // late AppLifecycleState? _state;

  @override
  void initState() {
    super.initState();
    loadPersistedStates();
    // _state = SchedulerBinding.instance.lifecycleState;

    /**
     * Events:-
     *  onShow, onResume, onHide,
     *  onPause, onDetach, onRestart, 
     *  onStateChange
     */
    _listener = AppLifecycleListener(
      onInactive: () => persist(),
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  void loadPersistedStates() async {
    await Provider.of<TimezoneModel>(context, listen: false)
      .init();
  }

  void persist() async {
    await Provider.of<TimezoneModel>(context, listen: false)
      .saveState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
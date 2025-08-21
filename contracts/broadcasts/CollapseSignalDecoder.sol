contract CollapseSignalDecoder {
    struct Signal {
        string source;
        string theme;
        bool panicTrigger;
        string timestamp;
    }

    Signal[] public signals;

    event SignalLogged(string source, string theme, bool panicTrigger);

    function logSignal(string memory source, string memory theme, bool panicTrigger, string memory timestamp) public {
        signals.push(Signal(source, theme, panicTrigger, timestamp));
        emit SignalLogged(source, theme, panicTrigger);
    }
}

contract AdversarialSignalMirror {
    address public steward = msg.sender;
    struct Signal {
        string origin;
        string type;
        bool anomalyDetected;
        string proxyStatus;
    }

    Signal[] public signals;
    mapping(string => bool) public shuffleZones;
    mapping(address => bool) public alertRecipients;

    event SignalLogged(string origin, string type, bool anomaly, string proxy);
    event ShuffleZoneMarked(string zone);
    event AlertBroadcasted(address recipient, string message);

    function logSignal(string memory origin, string memory signalType, bool anomaly, string memory proxy) public {
        signals.push(Signal(origin, signalType, anomaly, proxy));
        emit SignalLogged(origin, signalType, anomaly, proxy);
    }

    function markShuffleZone(string memory zone) public {
        shuffleZones[zone] = true;
        emit ShuffleZoneMarked(zone);
    }

    function registerRecipient(address recipient) public {
        alertRecipients[recipient] = true;
    }

    function broadcastAlert(address recipient, string memory message) public {
        require(alertRecipients[recipient], "Recipient not registered");
        emit AlertBroadcasted(recipient, message);
    }
}

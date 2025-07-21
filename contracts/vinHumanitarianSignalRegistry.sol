// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinHumanitarianSignalRegistry {
    struct AidSignal {
        string title;
        string location;
        string aidType; // e.g., Medical, Food, Shelter, Legal
        address submitter;
        uint256 timestamp;
        string metadataLink;
        bool verified;
    }

    address public scrollkeeper;
    mapping(uint256 => AidSignal) public aidSignals;
    uint256 public signalCount;

    event SignalSubmitted(uint256 indexed id, address indexed submitter, string title);
    event SignalVerified(uint256 indexed id, address verifier);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function submitAidSignal(
        string memory _title,
        string memory _location,
        string memory _aidType,
        string memory _metadataLink
    ) public {
        aidSignals[signalCount] = AidSignal({
            title: _title,
            location: _location,
            aidType: _aidType,
            submitter: msg.sender,
            timestamp: block.timestamp,
            metadataLink: _metadataLink,
            verified: false
        });

        emit SignalSubmitted(signalCount, msg.sender, _title);
        signalCount++;
    }

    function verifySignal(uint256 _id) public {
        require(msg.sender == scrollkeeper, "Only scrollkeeper can verify.");
        require(_id < signalCount, "Signal does not exist.");
        aidSignals[_id].verified = true;
        emit SignalVerified(_id, msg.sender);
    }

    function getSignal(uint256 _id) public view returns (AidSignal memory) {
        return aidSignals[_id];
    }
}

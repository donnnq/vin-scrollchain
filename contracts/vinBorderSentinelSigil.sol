// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Border Sentinel Sigil
/// @notice Symbolic guardian that detects and logs unauthorized entries
contract vinBorderSentinelSigil {
    address public creator;
    string public sentinelName = "Vinvin's Border Sentinel Sigil";

    struct Intrusion {
        string origin;
        string method;
        uint timestamp;
        bool isDetained;
    }

    mapping(address => Intrusion) public intrusions;
    address[] public intruderList;

    event IntrusionDetected(address indexed intruder, string origin, string method, uint timestamp);
    event IntruderDetained(address indexed intruder);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can activate the sentinel");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function detectIntrusion(address _intruder, string memory _origin, string memory _method) public onlyCreator {
        intrusions[_intruder] = Intrusion(_origin, _method, block.timestamp, false);
        intruderList.push(_intruder);
        emit IntrusionDetected(_intruder, _origin, _method, block.timestamp);
    }

    function detainIntruder(address _intruder) public onlyCreator {
        require(intrusions[_intruder].timestamp != 0, "Intruder not detected");
        intrusions[_intruder].isDetained = true;
        emit IntruderDetained(_intruder);
    }

    function getIntrusion(address _intruder) public view returns (Intrusion memory) {
        return intrusions[_intruder];
    }

    function getAllIntruders() public view returns (address[] memory) {
        return intruderList;
    }
}

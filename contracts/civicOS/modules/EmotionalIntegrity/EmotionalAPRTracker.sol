// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract EmotionalAPRTracker {
    address public steward;

    struct APRLog {
        uint256 empathyScore;       // 0–100
        uint256 trustScore;         // 0–100
        uint256 mythicClarityScore; // 0–100
        string civicNote;
        uint256 timestamp;
    }

    mapping(string => APRLog[]) public siteAPR;

    event APRLogged(string siteLocation, uint256 empathy, uint256 trust, uint256 clarity, string note);

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can log APR");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAPR(string memory _location, uint256 _empathy, uint256 _trust, uint256 _clarity, string memory _note) public onlySteward {
        APRLog memory log = APRLog(_empathy, _trust, _clarity, _note, block.timestamp);
        siteAPR[_location].push(log);
        emit APRLogged(_location, _empathy, _trust, _clarity, _note);
    }

    function getAPRHistory(string memory _location) public view returns (APRLog[] memory) {
        return siteAPR[_location];
    }
}

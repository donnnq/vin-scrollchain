// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToClimateAdaptationGrid {
    string public batchID = "1321.9.185";
    string public steward = "Vinvin";

    address public admin;

    struct AdaptationEvent {
        string sector;      // agriculture, energy, water
        string measure;     // reforestation, renewable shift, conservation
        uint256 timestamp;
    }

    AdaptationEvent[] public events;

    event AdaptationLogged(string sector, string measure);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAdaptation(string memory sector, string memory measure) public onlyAdmin {
        events.push(AdaptationEvent(sector, measure, block.timestamp));
        emit AdaptationLogged(sector, measure);
    }

    function getAdaptation(uint256 index) public view returns (string memory sector, string memory measure, uint256 timestamp) {
        AdaptationEvent memory e = events[index];
        return (e.sector, e.measure, e.timestamp);
    }
}

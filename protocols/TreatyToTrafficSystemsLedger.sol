// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToTrafficSystemsLedger {
    string public batchID = "1321.9.193";
    string public steward = "Vinvin";

    address public admin;

    struct TrafficSystem {
        string area;        // intersection, highway, city center
        string measure;     // signal audit, congestion report, safety check
        uint256 timestamp;
    }

    TrafficSystem[] public systems;

    event TrafficLogged(string area, string measure);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTraffic(string memory area, string memory measure) public onlyAdmin {
        systems.push(TrafficSystem(area, measure, block.timestamp));
        emit TrafficLogged(area, measure);
    }

    function getTraffic(uint256 index) public view returns (string memory area, string memory measure, uint256 timestamp) {
        TrafficSystem memory ts = systems[index];
        return (ts.area, ts.measure, ts.timestamp);
    }
}

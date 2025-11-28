// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToResilienceLedger {
    string public batchID = "1321.9.162";
    string public steward = "Vinvin";

    address public admin;

    struct ResilienceAction {
        string measure;     // migration, simulation, recovery
        string system;
        uint256 timestamp;
    }

    ResilienceAction[] public actions;

    event ResilienceLogged(string measure, string system);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logResilience(string memory measure, string memory system) public onlyAdmin {
        actions.push(ResilienceAction(measure, system, block.timestamp));
        emit ResilienceLogged(measure, system);
    }

    function getResilience(uint256 index) public view returns (string memory measure, string memory system, uint256 timestamp) {
        ResilienceAction memory r = actions[index];
        return (r.measure, r.system, r.timestamp);
    }
}

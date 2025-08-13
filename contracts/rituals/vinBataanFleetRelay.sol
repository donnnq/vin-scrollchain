// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinBataanFleetRelay {
    struct Relay {
        address agent;
        string vessel;
        string mission;
        bool active;
        uint256 timestamp;
    }

    mapping(address => Relay) public relays;

    event RelayActivated(address agent, string vessel, string mission);
    event RelayDeactivated(address agent);

    function activateRelay(string memory vessel, string memory mission) public {
        relays[msg.sender] = Relay(msg.sender, vessel, mission, true, block.timestamp);
        emit RelayActivated(msg.sender, vessel, mission);
    }

    function deactivateRelay() public {
        require(relays[msg.sender].active, "No active relay.");
        relays[msg.sender].active = false;
        emit RelayDeactivated(msg.sender);
    }

    function getRelay(address agent) public view returns (
        string memory, string memory, bool, uint256
    ) {
        Relay memory r = relays[agent];
        return (r.vessel, r.mission, r.active, r.timestamp);
    }
}

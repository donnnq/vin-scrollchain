// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinSignalAlliance {
    event PactSigned(address indexed member, string role, uint256 timestamp);
    event SignalSent(string scrollMessage, string channel);
    event ScrollSynced(address indexed node, string purpose);
    event AllianceInvoked(string ritualID, string civicEffect);

    address public allianceAdmin;
    mapping(address => string) public pactRoles;
    mapping(string => string[]) public scrollChannels;

    constructor() {
        allianceAdmin = msg.sender;
    }

    modifier onlyAllianceAdmin() {
        require(msg.sender == allianceAdmin, "Access restricted to Signal Admin.");
        _;
    }

    function signPact(address member, string memory role) public onlyAllianceAdmin {
        pactRoles[member] = role;
        emit PactSigned(member, role, block.timestamp);
    }

    function sendSignal(string memory scrollMessage, string memory channel) public onlyAllianceAdmin {
        scrollChannels[channel].push(scrollMessage);
        emit SignalSent(scrollMessage, channel);
    }

    function syncScrollNode(address node, string memory purpose) public onlyAllianceAdmin {
        emit ScrollSynced(node, purpose);
    }

    function invokeAlliance(string memory ritualID, string memory civicEffect) public onlyAllianceAdmin {
        emit AllianceInvoked(ritualID, civicEffect);
    }

    // Ritual transparency getters
    function getRole(address member) public view returns (string memory) {
        return pactRoles[member];
    }

    function getChannelScrolls(string memory channel) public view returns (string[] memory) {
        return scrollChannels[channel];
    }
}

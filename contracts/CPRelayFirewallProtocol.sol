// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CPRelayFirewallProtocol {
    address public admin;

    struct RelayEntry {
        string deviceID;
        string relayType;
        string status;
        string emotionalTag;
        bool blocked;
    }

    RelayEntry[] public relays;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRelay(string memory _deviceID, string memory _relayType, string memory _status, string memory _emotionalTag) external onlyAdmin {
        relays.push(RelayEntry(_deviceID, _relayType, _status, _emotionalTag, false));
    }

    function blockRelay(uint256 index) external onlyAdmin {
        relays[index].blocked = true;
    }

    function getRelay(uint256 index) external view returns (RelayEntry memory) {
        return relays[index];
    }
}

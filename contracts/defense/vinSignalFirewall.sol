// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinSignalFirewall {
    mapping(address => bool) public blockedContracts;
    event SignalBlocked(address indexed offender, string reason);

    function blockContract(address offender, string memory reason) external {
        blockedContracts[offender] = true;
        emit SignalBlocked(offender, reason);
    }

    function isBlocked(address contractAddress) external view returns (bool) {
        return blockedContracts[contractAddress];
    }

    modifier onlyUnblocked(address contractAddress) {
        require(!blockedContracts[contractAddress], "Signal blocked by firewall");
        _;
    }

    // Example usage
    function interact(address target) external onlyUnblocked(target) {
        // Safe interaction logic
    }
}

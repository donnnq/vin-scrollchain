// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinWorkerPrivilegeScroll {
    struct Privilege {
        bool housingAccess;
        uint256 discountRate; // % discount on work-related purchases
        string status; // "Trial", "Extended", "Permanent"
        uint256 timestamp;
    }

    mapping(address => Privilege) public privileges;

    event PrivilegeGranted(address indexed worker, bool housingAccess, uint256 discountRate, string status);

    function grantPrivilege(address worker, string memory status) public {
        require(privileges[worker].timestamp == 0, "Privilege already granted.");
        bool housing = keccak256(bytes(status)) != keccak256("Trial"); // Housing starts at Extended
        uint256 discount = keccak256(bytes(status)) == keccak256("Permanent") ? 30 : 15; // 15% or 30%
        privileges[worker] = Privilege(housing, discount, status, block.timestamp);
        emit PrivilegeGranted(worker, housing, discount, status);
    }

    function getPrivilege(address worker) public view returns (
        bool, uint256, string memory, uint256
    ) {
        Privilege memory p = privileges[worker];
        return (p.housingAccess, p.discountRate, p.status, p.timestamp);
    }
}

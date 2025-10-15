// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayOversightBroadcastRegistryDAO {
    address public admin;

    struct BroadcastEntry {
        string purokOrBarangay;
        string oversightMessage;
        string platform;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _purokOrBarangay, string memory _oversightMessage, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        registry.push(BroadcastEntry(_purokOrBarangay, _oversightMessage, _platform, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        registry[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return registry[index];
    }
}

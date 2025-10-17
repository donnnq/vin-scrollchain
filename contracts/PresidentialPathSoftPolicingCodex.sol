// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PresidentialPathSoftPolicingCodex {
    address public admin;

    struct PathEntry {
        string location;
        string securityProtocol;
        string emotionalTag;
        bool activated;
        bool cleared;
    }

    PathEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function activatePath(string memory location, string memory securityProtocol, string memory emotionalTag) external onlyAdmin {
        entries.push(PathEntry(location, securityProtocol, emotionalTag, true, false));
    }

    function clearPath(uint256 index) external onlyAdmin {
        entries[index].cleared = true;
    }

    function getPathEntry(uint256 index) external view returns (PathEntry memory) {
        return entries[index];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PensionSovereigntyFellowship {
    address public admin;

    struct FellowshipEntry {
        string retireeName;
        string pensionSystem;
        string equityConcern;
        string emotionalTag;
        bool supported;
        bool reinforced;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logSupport(string memory retireeName, string memory pensionSystem, string memory equityConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(retireeName, pensionSystem, equityConcern, emotionalTag, false, false));
    }

    function markSupported(uint256 index) external onlyAdmin {
        entries[index].supported = true;
    }

    function reinforceSupport(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getSupport(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}

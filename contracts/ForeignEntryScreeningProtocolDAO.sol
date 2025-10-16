// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForeignEntryScreeningProtocolDAO {
    address public admin;

    struct ScreeningEntry {
        string nationality;
        string entryPoint;
        string screeningType; // e.g., biometric, interview, background check
        string emotionalTag;
        bool cleared;
    }

    ScreeningEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory nationality, string memory entryPoint, string memory screeningType, string memory emotionalTag) external onlyAdmin {
        entries.push(ScreeningEntry(nationality, entryPoint, screeningType, emotionalTag, false));
    }

    function clearEntry(uint256 index) external onlyAdmin {
        entries[index].cleared = true;
    }

    function getEntry(uint256 index) external view returns (ScreeningEntry memory) {
        return entries[index];
    }
}

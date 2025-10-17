// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlatformOutageSatireCodex {
    address public admin;

    struct SatireEntry {
        string platformName;
        string outageSignal;
        string memeHighlight;
        string emotionalTag;
        bool aired;
        bool archived;
    }

    SatireEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitSatire(string memory platformName, string memory outageSignal, string memory memeHighlight, string memory emotionalTag) external onlyAdmin {
        entries.push(SatireEntry(platformName, outageSignal, memeHighlight, emotionalTag, false, false));
    }

    function airSatire(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function archiveSatire(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getSatireEntry(uint256 index) external view returns (SatireEntry memory) {
        return entries[index];
    }
}

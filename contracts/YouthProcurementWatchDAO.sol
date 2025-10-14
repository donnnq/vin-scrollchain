// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthProcurementWatchDAO {
    address public admin;

    struct WatchEntry {
        string purokOrBarangay;
        string projectType;
        string oversightMethod;
        string emotionalTag;
        bool deployed;
    }

    WatchEntry[] public watchlist;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _purokOrBarangay, string memory _projectType, string memory _oversightMethod, string memory _emotionalTag) external onlyAdmin {
        watchlist.push(WatchEntry(_purokOrBarangay, _projectType, _oversightMethod, _emotionalTag, false));
    }

    function deployEntry(uint256 index) external onlyAdmin {
        watchlist[index].deployed = true;
    }

    function getEntry(uint256 index) external view returns (WatchEntry memory) {
        return watchlist[index];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangaySovereigntyBroadcastPackDAO {
    address public admin;

    struct BroadcastEntry {
        string barangayName;
        string sovereigntyTheme;
        string platform;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _barangayName, string memory _sovereigntyTheme, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_barangayName, _sovereigntyTheme, _platform, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}

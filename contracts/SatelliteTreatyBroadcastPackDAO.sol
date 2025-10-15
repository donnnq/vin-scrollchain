// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SatelliteTreatyBroadcastPackDAO {
    address public admin;

    struct TreatyEntry {
        string treatyLabel;
        string broadcastClause;
        string emotionalTag;
        bool published;
    }

    TreatyEntry[] public treaties;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _treatyLabel, string memory _broadcastClause, string memory _emotionalTag) external onlyAdmin {
        treaties.push(TreatyEntry(_treatyLabel, _broadcastClause, _emotionalTag, false));
    }

    function markPublished(uint256 index) external onlyAdmin {
        treaties[index].published = true;
    }

    function getEntry(uint256 index) external view returns (TreatyEntry memory) {
        return treaties[index];
    }
}

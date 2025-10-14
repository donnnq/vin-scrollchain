// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AITreatyBroadcastDAO {
    address public admin;

    struct TreatyEntry {
        string treatyName;
        string signatoryCountry;
        string broadcastPlatform;
        string emotionalTag;
        bool aired;
    }

    TreatyEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _treatyName, string memory _signatoryCountry, string memory _broadcastPlatform, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(TreatyEntry(_treatyName, _signatoryCountry, _broadcastPlatform, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getTreaty(uint256 index) external view returns (TreatyEntry memory) {
        return broadcasts[index];
    }
}

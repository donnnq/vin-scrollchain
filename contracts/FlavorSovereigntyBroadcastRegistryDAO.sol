// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlavorSovereigntyBroadcastRegistryDAO {
    address public admin;

    struct BroadcastEntry {
        string flavorProfile;
        string region;
        string sovereigntyMessage;
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

    function submitBroadcast(string memory _flavorProfile, string memory _region, string memory _sovereigntyMessage, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_flavorProfile, _region, _sovereigntyMessage, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}

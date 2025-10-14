// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnergySovereigntyLivestreamProtocolDAO {
    address public admin;

    struct LivestreamEntry {
        string region;
        string energyMilestone;
        string platform;
        string emotionalTag;
        bool broadcasted;
    }

    LivestreamEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scheduleLivestream(string memory _region, string memory _energyMilestone, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        protocols.push(LivestreamEntry(_region, _energyMilestone, _platform, _emotionalTag, false));
    }

    function markBroadcasted(uint256 index) external onlyAdmin {
        protocols[index].broadcasted = true;
    }

    function getLivestream(uint256 index) external view returns (LivestreamEntry memory) {
        return protocols[index];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IndustrialApprenticeshipLivestreamProtocolDAO {
    address public admin;

    struct LivestreamEntry {
        string apprenticeName;
        string skillTrack;
        string livestreamPlatform;
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

    function scheduleLivestream(string memory _apprenticeName, string memory _skillTrack, string memory _livestreamPlatform, string memory _emotionalTag) external onlyAdmin {
        protocols.push(LivestreamEntry(_apprenticeName, _skillTrack, _livestreamPlatform, _emotionalTag, false));
    }

    function markBroadcasted(uint256 index) external onlyAdmin {
        protocols[index].broadcasted = true;
    }

    function getLivestream(uint256 index) external view returns (LivestreamEntry memory) {
        return protocols[index];
    }
}

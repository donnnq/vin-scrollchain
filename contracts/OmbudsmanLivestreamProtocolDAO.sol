// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OmbudsmanLivestreamProtocolDAO {
    address public admin;

    struct LivestreamCase {
        string caseName;
        string accusedEntity;
        string platform;
        string emotionalTag;
        bool broadcasted;
    }

    LivestreamCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scheduleLivestream(string memory _caseName, string memory _accusedEntity, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        cases.push(LivestreamCase(_caseName, _accusedEntity, _platform, _emotionalTag, false));
    }

    function markBroadcasted(uint256 index) external onlyAdmin {
        cases[index].broadcasted = true;
    }

    function getLivestream(uint256 index) external view returns (LivestreamCase memory) {
        return cases[index];
    }
}

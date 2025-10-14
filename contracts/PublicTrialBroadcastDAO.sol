// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicTrialBroadcastDAO {
    address public admin;

    struct Trial {
        string caseName;
        string accusedEntity;
        string broadcastChannel;
        string emotionalTag;
        bool livestreamed;
    }

    Trial[] public trials;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scheduleTrial(string memory _caseName, string memory _accusedEntity, string memory _broadcastChannel, string memory _emotionalTag) external onlyAdmin {
        trials.push(Trial(_caseName, _accusedEntity, _broadcastChannel, _emotionalTag, false));
    }

    function markLivestreamed(uint256 index) external onlyAdmin {
        trials[index].livestreamed = true;
    }

    function getTrial(uint256 index) external view returns (Trial memory) {
        return trials[index];
    }
}

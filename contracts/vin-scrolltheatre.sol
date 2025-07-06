// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollTheatre {
    struct Act {
        string title;
        string role;
        address performer;
        string action;
        uint256 timestamp;
    }

    struct Play {
        string name;
        string mythId;
        string theme;
        Act[] acts;
        bool completed;
        uint256 startedAt;
    }

    Play[] public plays;
    address public immutable theatreMaster;

    event PlayStarted(uint256 indexed id, string name, string theme, string mythId, uint256 timestamp);
    event ActPerformed(uint256 indexed playId, string role, address performer, string action, uint256 timestamp);
    event PlayCompleted(uint256 indexed id, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == theatreMaster, "Not the theatre master");
        _;
    }

    constructor() {
        theatreMaster = msg.sender;
    }

    function startPlay(string calldata name, string calldata mythId, string calldata theme) external onlyMaster {
        plays.push(Play({
            name: name,
            mythId: mythId,
            theme: theme,
            acts: new Act[](0),
            completed: false,
            startedAt: block.timestamp
        }));

        emit PlayStarted(plays.length - 1, name, theme, mythId, block.timestamp);
    }

    function performAct(uint256 playId, string calldata role, string calldata action) external {
        require(playId < plays.length, "Invalid play ID");
        require(!plays[playId].completed, "Play already completed");

        plays[playId].acts.push(Act({
            title: string(abi.encodePacked("Act ", uint2str(plays[playId].acts.length + 1))),
            role: role,
            performer: msg.sender,
            action: action,
            timestamp: block.timestamp
        }));

        emit ActPerformed(playId, role, msg.sender, action, block.timestamp);
    }

    function completePlay(uint256 playId) external onlyMaster {
        require(playId < plays.length, "Invalid play ID");
        require(!plays[playId].completed, "Already completed");
        plays[playId].completed = true;
        emit PlayCompleted(playId, block.timestamp);
    }

    function getPlay(uint256 id) external view returns (Play memory) {
        require(id < plays.length, "Invalid play ID");
        return plays[id];
    }

    function totalPlays() external view returns (uint256) {
        return plays.length;
    }

    function uint2str(uint256 _i) internal pure returns (string memory str) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 length;
        while (j != 0) { length++; j /= 10; }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        j = _i;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10));
            j /= 10;
        }
        str = string(bstr);
    }
}

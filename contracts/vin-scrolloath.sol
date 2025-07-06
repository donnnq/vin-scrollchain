// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollOath {
    struct Oath {
        string title;
        string vow;
        address swearing;
        string role;
        bool fulfilled;
        bool broken;
        uint256 timestamp;
    }

    Oath[] public oaths;
    address public immutable oathkeeper;

    event OathSworn(uint256 indexed id, address indexed swearing, string title, string role, string vow, uint256 timestamp);
    event OathFulfilled(uint256 indexed id, uint256 timestamp);
    event OathBroken(uint256 indexed id, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == oathkeeper, "Not the oathkeeper");
        _;
    }

    constructor() {
        oathkeeper = msg.sender;
    }

    function swearOath(
        string calldata title,
        string calldata vow,
        address swearing,
        string calldata role
    ) external onlyKeeper {
        oaths.push(Oath({
            title: title,
            vow: vow,
            swearing: swearing,
            role: role,
            fulfilled: false,
            broken: false,
            timestamp: block.timestamp
        }));

        emit OathSworn(oaths.length - 1, swearing, title, role, vow, block.timestamp);
    }

    function fulfillOath(uint256 id) external onlyKeeper {
        require(id < oaths.length, "Invalid oath ID");
        require(!oaths[id].fulfilled && !oaths[id].broken, "Already resolved");
        oaths[id].fulfilled = true;
        emit OathFulfilled(id, block.timestamp);
    }

    function breakOath(uint256 id) external onlyKeeper {
        require(id < oaths.length, "Invalid oath ID");
        require(!oaths[id].fulfilled && !oaths[id].broken, "Already resolved");
        oaths[id].broken = true;
        emit OathBroken(id, block.timestamp);
    }

    function getOath(uint256 id) external view returns (Oath memory) {
        require(id < oaths.length, "Invalid oath ID");
        return oaths[id];
    }

    function totalOaths() external view returns (uint256) {
        return oaths.length;
    }
}

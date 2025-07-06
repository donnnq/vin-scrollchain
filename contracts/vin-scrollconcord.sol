// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollConcord {
    struct Concord {
        string name;
        address[] members;
        string sharedVow;
        string purpose;
        bool sealed;
        uint256 formedAt;
    }

    Concord[] public concords;
    mapping(string => uint256) public nameToId;
    address public immutable concordKeeper;

    event ConcordFormed(uint256 indexed id, string name, string purpose, string sharedVow, uint256 timestamp);
    event MemberJoined(uint256 indexed id, address member, uint256 timestamp);
    event ConcordSealed(uint256 indexed id, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == concordKeeper, "Not the concord keeper");
        _;
    }

    constructor() {
        concordKeeper = msg.sender;
    }

    function formConcord(
        string calldata name,
        string calldata sharedVow,
        string calldata purpose
    ) external onlyKeeper {
        require(nameToId[name] == 0, "Concord already exists");

        concords.push(Concord({
            name: name,
            members: new address[](0),
            sharedVow: sharedVow,
            purpose: purpose,
            sealed: false,
            formedAt: block.timestamp
        }));

        nameToId[name] = concords.length;
        emit ConcordFormed(concords.length - 1, name, purpose, sharedVow, block.timestamp);
    }

    function joinConcord(uint256 id, address member) external onlyKeeper {
        require(id < concords.length, "Invalid concord ID");
        require(!concords[id].sealed, "Concord is sealed");

        concords[id].members.push(member);
        emit MemberJoined(id, member, block.timestamp);
    }

    function sealConcord(uint256 id) external onlyKeeper {
        require(id < concords.length, "Invalid concord ID");
        concords[id].sealed = true;
        emit ConcordSealed(id, block.timestamp);
    }

    function getConcord(uint256 id) external view returns (Concord memory) {
        require(id < concords.length, "Invalid concord ID");
        return concords[id];
    }

    function totalConcords() external view returns (uint256) {
        return concords.length;
    }
}

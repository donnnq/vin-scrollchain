// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollClanProtocol {
    struct Clan {
        string name;
        address leader;
        uint256 members;
        uint256 mythRank;
    }

    Clan[] public clans;
    mapping(address => uint256) public userToClan;

    event ClanCreated(string name, address indexed leader);
    event ClanJoined(uint256 clanId, address indexed member);
    event ClanRanked(uint256 clanId, uint256 newRank);

    function createClan(string calldata name) external {
        require(userToClan[msg.sender] == 0, "Already in a clan");
        clans.push(Clan(name, msg.sender, 1, 0));
        userToClan[msg.sender] = clans.length;
        emit ClanCreated(name, msg.sender);
    }

    function joinClan(uint256 clanId) external {
        require(clanId > 0 && clanId <= clans.length, "Invalid clan");
        require(userToClan[msg.sender] == 0, "Already in a clan");

        clans[clanId - 1].members += 1;
        userToClan[msg.sender] = clanId;
        emit ClanJoined(clanId, msg.sender);
    }

    function boostClanRank(uint256 clanId, uint256 points) external {
        require(clanId > 0 && clanId <= clans.length, "Invalid clan");
        require(userToClan[msg.sender] == clanId, "Not your clan");

        clans[clanId - 1].mythRank += points;
        emit ClanRanked(clanId, clans[clanId - 1].mythRank);
    }

    function getClan(uint256 clanId) external view returns (string memory, address, uint256, uint256) {
        Clan memory c = clans[clanId - 1];
        return (c.name, c.leader, c.members, c.mythRank);
    }
}

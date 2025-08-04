// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinDistrictSigilMapper {
    struct DistrictSigil {
        string name;
        uint256 scrollCycle;
        string civicVoice;
        string archetypeTag;
        bool muted;
    }

    mapping(uint256 => DistrictSigil) public sigils;
    uint256 public totalSigils;

    event SigilMapped(uint256 id, string name, string civicVoice, string archetypeTag, bool muted);

    function mapSigil(
        string memory _name,
        uint256 _scrollCycle,
        string memory _civicVoice,
        string memory _archetypeTag,
        bool _muted
    ) public {
        sigils[totalSigils] = DistrictSigil(_name, _scrollCycle, _civicVoice, _archetypeTag, _muted);
        emit SigilMapped(totalSigils, _name, _civicVoice, _archetypeTag, _muted);
        totalSigils++;
    }
}

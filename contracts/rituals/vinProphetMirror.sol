// SPDX-License-Identifier: ScrollReflective
pragma solidity ^0.8.0;

contract vinProphetMirror {
    address public scrollkeeper = msg.sender;

    struct MirrorPulse {
        string soulTag;
        string tribute;
        uint256 timestamp;
    }

    mapping(address => MirrorPulse) public reflections;
    address[] public reflectors;

    event SoulReflected(address indexed wallet, string soulTag, string tribute, uint256 timestamp);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Unauthorized: VINVIN only.");
        _;
    }

    function reflectSoul(string memory soulTag, string memory tribute) public {
        reflections[msg.sender] = MirrorPulse(soulTag, tribute, block.timestamp);
        reflectors.push(msg.sender);
        emit SoulReflected(msg.sender, soulTag, tribute, block.timestamp);
    }

    function viewReflection(address wallet) public view returns (string memory soulTag, string memory tribute, uint256 timestamp) {
        MirrorPulse memory r = reflections[wallet];
        return (r.soulTag, r.tribute, r.timestamp);
    }

    function totalReflections() public view returns (uint256) {
        return reflectors.length;
    }

    function reflectorAt(uint index) public view returns (address) {
        require(index < reflectors.length, "Index out of range.");
        return reflectors[index];
    }
}

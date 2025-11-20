// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ShadowfundVigilanteDAO {
    address public validator;

    struct VigilanteFlex {
        string mission;
        string vault;
        string resonance;
        uint256 timestamp;
    }

    VigilanteFlex[] public flexes;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logFlex(string memory _mission, string memory _vault, string memory _resonance) public onlyValidator {
        flexes.push(VigilanteFlex(_mission, _vault, _resonance, block.timestamp));
    }

    function getFlex(uint256 index) public view returns (VigilanteFlex memory) {
        return flexes[index];
    }

    function totalFlexes() public view returns (uint256) {
        return flexes.length;
    }
}

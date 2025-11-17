// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract StrategicSupplyChainTransparencyProtocol {
    address public validator;

    struct Chain {
        string material;
        string origin;
        string destination;
        string transparencyTag;
        uint256 timestamp;
    }

    Chain[] public chains;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logChain(string memory _material, string memory _origin, string memory _destination, string memory _tag) public onlyValidator {
        chains.push(Chain(_material, _origin, _destination, _tag, block.timestamp));
    }

    function getChain(uint256 index) public view returns (Chain memory) {
        return chains[index];
    }

    function totalChains() public view returns (uint256) {
        return chains.length;
    }
}

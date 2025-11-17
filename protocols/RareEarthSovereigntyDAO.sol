// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RareEarthSovereigntyDAO {
    address public validator;

    struct Resource {
        string mineral;
        string location;
        uint256 reserves;
        string sovereigntyTag;
        uint256 timestamp;
    }

    Resource[] public resources;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logResource(string memory _mineral, string memory _location, uint256 _reserves, string memory _tag) public onlyValidator {
        resources.push(Resource(_mineral, _location, _reserves, _tag, block.timestamp));
    }

    function getResource(uint256 index) public view returns (Resource memory) {
        return resources[index];
    }

    function totalResources() public view returns (uint256) {
        return resources.length;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CommunalMercyDistributionProtocol {
    address public validator;

    struct MercyDrop {
        address recipient;
        uint256 amount;
        string sincerityProof;
        uint256 timestamp;
    }

    MercyDrop[] public drops;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function distribute(address _recipient, uint256 _amount, string memory _proof) public onlyValidator {
        drops.push(MercyDrop(_recipient, _amount, _proof, block.timestamp));
    }

    function getDrop(uint256 index) public view returns (MercyDrop memory) {
        return drops[index];
    }

    function totalDrops() public view returns (uint256) {
        return drops.length;
    }
}

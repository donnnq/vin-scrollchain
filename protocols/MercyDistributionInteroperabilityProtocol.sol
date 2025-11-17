// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MercyDistributionInteroperabilityProtocol {
    address public validator;

    struct MercyTx {
        string sourceChain;
        string targetChain;
        address recipient;
        uint256 amount;
        string sincerityTag;
        uint256 timestamp;
    }

    MercyTx[] public transfers;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function bridgeMercy(string memory _source, string memory _target, address _recipient, uint256 _amount, string memory _tag) public onlyValidator {
        transfers.push(MercyTx(_source, _target, _recipient, _amount, _tag, block.timestamp));
    }

    function getTransfer(uint256 index) public view returns (MercyTx memory) {
        return transfers[index];
    }

    function totalTransfers() public view returns (uint256) {
        return transfers.length;
    }
}

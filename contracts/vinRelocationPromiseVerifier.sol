// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinRelocationPromiseVerifier {
    address public cityArchitect;

    struct Promise {
        address beneficiary;
        string newHomeLocation;
        bool fulfilled;
        uint256 promiseDate;
    }

    mapping(address => Promise) public promises;

    event PromiseMade(address indexed beneficiary, string newHomeLocation);
    event PromiseFulfilled(address indexed beneficiary);

    modifier onlyArchitect() {
        require(msg.sender == cityArchitect, "Unauthorized");
        _;
    }

    constructor(address _architect) {
        cityArchitect = _architect;
    }

    function makePromise(address beneficiary, string memory newHomeLocation) external onlyArchitect {
        promises[beneficiary] = Promise(beneficiary, newHomeLocation, false, block.timestamp);
        emit PromiseMade(beneficiary, newHomeLocation);
    }

    function fulfillPromise(address beneficiary) external onlyArchitect {
        require(!promises[beneficiary].fulfilled, "Already fulfilled");
        promises[beneficiary].fulfilled = true;
        emit PromiseFulfilled(beneficiary);
    }

    function verifyPromise(address beneficiary) external view returns (string memory location, bool isFulfilled) {
        Promise memory p = promises[beneficiary];
        return (p.newHomeLocation, p.fulfilled);
    }
}

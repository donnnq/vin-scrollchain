// NomineeController.sol
pragma solidity ^0.8.0;

contract NomineeController {
    address public owner;
    address public nominee;
    uint256 public lastInteraction;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event NomineeSet(address indexed nominee);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor(address _nominee) {
        owner = msg.sender;
        nominee = _nominee;
        lastInteraction = block.timestamp;
        emit NomineeSet(_nominee);
    }

    // update activity to reset Dead Man's Switch
    function ping() public onlyOwner {
        lastInteraction = block.timestamp;
    }

    // check if 1 year has passed without interaction
    function checkAndTransfer() public {
        require(block.timestamp > lastInteraction + 365 days, "Owner still active");
        emit OwnershipTransferred(owner, nominee);
        owner = nominee;
    }

    // update nominee if needed
    function updateNominee(address _newNominee) public onlyOwner {
        nominee = _newNominee;
        emit NomineeSet(_newNominee);
    }
}

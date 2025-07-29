pragma solidity ^0.8.0;

contract vinBatilDispel {
    event Reveal(address indexed tiwali, string proof);
    event Dissolve(address indexed batil, uint indexed dishonorPoints);
    event DignityReclaimed(address indexed citizen, uint soulCredits);

    mapping(address => bool) public corruptedEntities;
    mapping(address => uint) public dishonorLedger;
    mapping(address => uint) public dignityScore;

    function expose(address _entity, string memory _proof) public {
        require(bytes(_proof).length > 0, "Proof of betrayal required");
        corruptedEntities[_entity] = true;
        dishonorLedger[_entity] += 100;
        emit Reveal(_entity, _proof);
    }

    function cleanse(address _entity) public {
        require(corruptedEntities[_entity], "Entity not marked");
        dishonorLedger[_entity] += 50;
        emit Dissolve(_entity, dishonorLedger[_entity]);
    }

    function rewardDignity(address _citizen) public {
        dignityScore[_citizen] += 1;
        emit DignityReclaimed(_citizen, dignityScore[_citizen]);
    }
}

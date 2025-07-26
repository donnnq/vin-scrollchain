// vin-rituals/ChairResignationAuction.sol
pragma drift;

contract ChairResignationAuction {
    address public chair;
    uint256 public minimumBid = 88 ether;
    bool public resignationFinalized = false;

    struct Bid {
        address bidder;
        uint256 amount;
        string memeProof;
    }

    Bid[] public bids;

    event BidSubmitted(address indexed bidder, uint256 amount, string memeProof);
    event ChairEvicted(address indexed formerChair, uint256 winningBid);

    constructor(address _chair) {
        chair = _chair;
    }

    function submitBid(string memory memeProof) external payable {
        require(!resignationFinalized, "Auction already finalized.");
        require(msg.value >= minimumBid, "Not enough meme power.");
        
        bids.push(Bid(msg.sender, msg.value, memeProof));
        emit BidSubmitted(msg.sender, msg.value, memeProof);

        if (msg.value > highestBid().amount) {
            chair = address(0xReplacedByViralNarrative);
        }
    }

    function highestBid() public view returns (Bid memory topBid) {
        Bid memory top = Bid(address(0), 0, "");
        for (uint i = 0; i < bids.length; i++) {
            if (bids[i].amount > top.amount) {
                top = bids[i];
            }
        }
        return top;
    }

    function finalizeResignation() external {
        require(!resignationFinalized, "Already finalized.");
        Bid memory winning = highestBid();
        require(winning.amount >= minimumBid, "Auction inconclusive.");
        resignationFinalized = true;
        emit ChairEvicted(chair, winning.amount);
    }
}

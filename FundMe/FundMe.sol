// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

// remix knows that @chainlink is coming from github as it is an npn package
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

contract FundMe {

    uint256 public miniUSD = 5e18; // in terms of usd

    address[] public funders; // addresses of all who funded us
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    // we set the function as payable to accept currency
    function fund() public payable{
        // Allow users to send USD
        // Have a minimum USD Sent
        // 
        // here we are seting a condition that input value should be greater than 10** 18 ETH or else it will revert with the following message
        require(getConversionRate(msg.value) > miniUSD, "did not send enough ETH"); // 1e18 = 1 ETH = 1 * 10 ** 18

        funders.push(msg.sender); // msg.sender is another global varibale which gives us address of who ever called the function
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

        // revert will undo any actions that have been done and send the remaing gass back
        // so lets say you create an INT variable and ask it to incrrment in this fucntion, so if the function reverts, incrementation will also get undo
        // and also the gas will only be refunded for which the computation is perform after the require line.. the above computaiton gass will not be refunded

    }

    function withdraw() public {
        
    }

    // state is not being modified we are only calling and returning the valye so view and return needed
    function getPrice() public view returns(uint256) {
        // we need the address and the abi
        // Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // interface of a contract is just an empty skeleton of it where we get all funcitons and their types just enough to get the ABI of the real contract

        // Here we are setting up the contract with the address to start using functions
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        // here the latestRoundData returns allot of values so we did not assigned any variable names of unwanted returns and only put up for the one we want
        // this gives value with 8 decimal places but msg.value has 18 decimal places. so to match the 2 we would need to add the remaining 10
        (, int256 price,,,) = priceFeed.latestRoundData();
        // now int256 is price and msg.value is uint256, so we need to resolve this by type casting
        return uint256(price) * 1e10;

    }
    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        // here we devided by 1e18 because both multiplication will give us 1e36 and we only need 1e18
        uint256 eathAmountInUsd = (ethAmount * ethPrice) / 1e18;
        return eathAmountInUsd;

    }
}
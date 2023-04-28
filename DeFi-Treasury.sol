pragma solidity ^0.8.0;

// Base code for a DeFi Treasury

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";

contract Treasury is Ownable {
    mapping(address => uint256) public distributionRatios;
    IUniswapV2Router02 public uniswapRouter;

    constructor(address _uniswapRouter) {
        uniswapRouter = IUniswapV2Router02(_uniswapRouter);
    }

    function setDistributionRatios(address[] memory protocols, uint256[] memory ratios) external onlyOwner {
        require(protocols.length == ratios.length, "Input arrays must have the same length");
        for (uint256 i = 0; i < protocols.length; i++) {
            distributionRatios[protocols[i]] = ratios[i];
        }
    }

    function depositStablecoin(address stablecoin, uint256 amount) external {
        IERC20(stablecoin).transferFrom(msg.sender, address(this), amount);
    }

    function distributeFunds(address stablecoin) external onlyOwner {
        uint256 balance = IERC20(stablecoin).balanceOf(address(this));
        // Calculate amounts to distribute based on distributionRatios
        // Swap stablecoin for USDT or DAI using Uniswap
    }

    function withdrawFunds(address protocol, uint256 amount) external onlyOwner {
        // Interact with the protocol's smart contract to withdraw the specified amount
    }

    function getAggregatedAPY() external view returns (uint256) {
        // Query APY of each protocol
        // Calculate weighted average based on distributionRatios
    }
}
